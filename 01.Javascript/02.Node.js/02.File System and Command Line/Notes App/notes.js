fs = require('fs');
chalk = require('chalk');

const addNote = (title, body) => {
    const notes = loadNotes();
    const duplications = notes.find((note) => note.title === title);

    if (!duplications){
        notes.push({
            title: title,
            body: body
        });

        saveNotes(notes);
        console.log(chalk.bgGreen("Saved!"));
    }else{
        console.log(chalk.bgRed("Duplication Error!!"))
    }
}
const removeNote = (title) => {
    const notes = loadNotes();
    const checking = notes.filter((note) => note.title !== title);

    if (checking.length === notes.length){
        console.log(chalk.bgRed("This note is not found!"));
    }else{
        saveNotes(checking);
        console.log(chalk.bgGreen("Note is removed!"));
    }
};

const listNotes = () => {
    console.log(chalk.green("Your Notes:"));

    const notes = loadNotes();

    notes.forEach((note)=>{
        console.log(note.title);
    })
}

const readNote = (title) => {
    const notes = loadNotes();

    const note = notes.find((n) => n.title === title);

    if (!note){
        console.log(chalk.bgRed("Note not found!"));
    }else{
        console.log(chalk.blue("Your Note:"))
        console.log(note.body);
    }
}

const loadNotes = () => {
    try{
        const dataFromJson = fs.readFileSync('notes.json').toString();
        const dataInObject = JSON.parse(dataFromJson);

        return dataInObject;
    }catch(e){
        return [];
    }
}

const saveNotes = (notes) => {
    const jsonFormat = JSON.stringify(notes);
    fs.writeFileSync('notes.json', jsonFormat);
}

module.exports = {
    addNote, removeNote, listNotes, readNote
};

