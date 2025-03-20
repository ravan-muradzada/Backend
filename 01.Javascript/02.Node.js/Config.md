While using Javascript, in package.json, entering this part might be useful:

```json
"scripts": {
    "start": "node src/index.js",
    "dev": "env-cmd -f ./config/dev.env nodemon src/index.js"
  }
```

However, if we use typescript instead, we will have two steps: the code should be compiled after each change in the files and it should be run automatically after all changes.

```json
"scripts": {
    "dev": "concurrently -k \"tsc --watch\" \"nodemon --watch dist dist/index.js\"",
    "build": "tsc",
    "start": "node dist/index.js"
  }
```
We need to download `concurrently` package for this process.

------
Basic `tsconfig file`:
```json
{
  "compilerOptions": {
    "target": "ES6",
    "module": "CommonJS",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true
  }
}
```

