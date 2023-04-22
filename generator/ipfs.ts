import bs58 from 'bs58';
import fetch from 'node-fetch';
import toIterable from 'stream-to-it';

interface Attributes {
  aip: number;
  author: string;
  discussions: string;
  title: string;
}

interface IpfsObject {
  aip: number;
  description: string;
  shortDescription: string;
  author: string;
  discussions: string;
  title: string;
}

interface UploadResult {
  error?: string;
  IpfsHash?: string;
}

const pinataEndpoint = 'https://api.pinata.cloud/pinning/pinJSONToIPFS';

export async function uploadToIpfs(attributes: Attributes, body: string) {
  const ipfsObject: IpfsObject = {
    aip: attributes.aip,
    description: body,
    shortDescription: body.split('\n').slice(0, 3).join('\n') + '...',
    author: attributes.author,
    discussions: attributes.discussions,
    title: attributes.title,
  };

  const {PINATA_KEY, PINATA_SECRET} = process.env;

  if (!PINATA_KEY || !PINATA_SECRET) {
    throw new Error('PINATA_KEY and PINATA_SECRET must be set');
  }

  console.log('👷‍♀️ Uploading AIP metadata to IPFS');
  console.log(' IPFS Object: ', JSON.stringify(ipfsObject, null, 2));
  const res = await fetch(pinataEndpoint, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      pinata_api_key: PINATA_KEY,
      pinata_secret_api_key: PINATA_SECRET,
    },
    body: JSON.stringify({
      pinataOptions: {cidVersion: 0},
      pinataContent: ipfsObject,
    }),
  });

  const json = (await res.json()) as UploadResult;
  if (json.error || !json.IpfsHash) {
    throw new Error(json.error);
  }

  const hash = json.IpfsHash;
  const encodedHash = encodeIpfsHash(hash);

  console.log('✅ Upload Success!');
  console.log(` IPFS hash: ${hash}`);
  console.log(` Encoded IPFS hash (for proposal creation): ${encodedHash}`);
  console.log(` See the file here: https://gateway.pinata.cloud/ipfs/${hash}`);
  console.log(
    ` Preview the blob here: https://app.aave.com/governance/ipfs-preview/?ipfsHash=${encodedHash}`
  );

  console.log('👷‍♀️ Pinning AIP metadata IPFS object to theGraph');
  await pinToTheGraph(hash);

  console.log('✅ Upload and Pin Success!');
  console.log(` IPFS hash: ${hash}`);
  console.log(` Encoded IPFS hash (for proposal creation): ${encodedHash}`);
  console.log(` See the file here: https://gateway.pinata.cloud/ipfs/${hash}`);
  console.log(
    ` Preview the blob here: https://app.aave.com/governance/ipfs-preview/?ipfsHash=${encodedHash}`
  );
  console.log(` You can now use the encoded hash in your CreateProposal script`);
}

function encodeIpfsHash(hash: string) {
  const encodedHash = `0x${bs58.decode(hash).subarray(2).toString('hex')}`;
  return encodedHash;
}

async function pinToTheGraph(hash: string) {
  const url = new URL('https://api.thegraph.com/ipfs/api/v0/pin/add');
  url.searchParams.append('recursive', 'true');
  url.searchParams.append('progress', 'true');
  url.searchParams.append('arg', hash);

  const res = await fetch(url, {
    method: 'POST',
  });

  let count = 0;
  let lastLine = '';
  for await (const chunk of toIterable.source(res.body)) {
    for (const line of chunk.toString().split('\n')) {
      count += 1;
      if (line) {
        lastLine = line;
      }

      if (count % 10 === 0) {
        console.log('👷‍♀️ Waiting for theGraph result...');
      }
    }
  }
  console.log('👷‍♀️ Graph Result: ', lastLine);
}
