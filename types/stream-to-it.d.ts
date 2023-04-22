declare module 'stream-to-it' {
  export function source(stream: any): AsyncIterable<Buffer>;
}
