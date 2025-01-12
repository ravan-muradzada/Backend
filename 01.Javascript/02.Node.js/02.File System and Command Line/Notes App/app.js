const notes = require('./notes.js');

const yargs = require('yargs');
yargs.version('1.1.0');

yargs.command({
    command: 'add',
    description: 'Adding a new note',
    builder: {
        title: {
            describe: 'Note title', 
            demandOption: true,
            type: 'string'
        },

        body: {
            describe: 'Note body',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv){
        notes.addNote(argv.title, argv.body);
    }
});

yargs.command({
    command: 'remove',
    description: 'To remove a note',
    builder: {
        title: {
            describe: 'Name of the note',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv){
        notes.removeNote(argv.title);
    }
});

yargs.command({
    command: 'list',
    description: 'List all notes',
    handler(){
        notes.listNotes();
    }    
});

yargs.command({
    command: 'read',
    description: 'Read the notes',
    builder: {
        title: {
            describe: 'Note name',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv){
        notes.readNote(argv.title);
    }    
})

yargs.parse();