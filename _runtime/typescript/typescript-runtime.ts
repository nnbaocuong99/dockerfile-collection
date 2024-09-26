// runtime.ts

import * as os from 'os';
import * as process from 'process';

function main(): void {
    console.log("TypeScript Runtime Environment");
    console.log(`Node.js version: ${process.version}`);
    console.log(`TypeScript version: ${getTSVersion()}`);
    console.log(`Current working directory: ${process.cwd()}`);
    console.log(`Platform: ${os.platform()}`);
    console.log(`CPU architecture: ${os.arch()}`);

    // Add your application logic here
    // For example:
    // import { App } from './app';
    // new App().start();
}

function getTSVersion(): string {
    try {
        return require('typescript').version;
    } catch {
        return 'TypeScript not found';
    }
}

main();
