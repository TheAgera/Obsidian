const { exec } = require('child_process');
const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');

function CallPowershell() {
    let Scriptpath = "C:\\Users\\ksuess\\Documents\\gitsync\\electronjs.ps1";
    let Scriptparameter = "2";

    let cmd = `powershell.exe -File "${Scriptpath}" -test "${Scriptparameter}"`;

    exec(cmd, (error,stdout,stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
}

function createWindow() {
    
    let win = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            nodeIntegration: true,
        }
        
    })
    win.loadFile(path.join(__dirname, 'index.html'));

    // Handle the button click event
    win.webContents.on('did-finish-load', () => {
        win.webContents.executeJavaScript(`
        const { ipcRenderer } = require('electron');
        const button = document.getElementById('myButton');
        button.addEventListener('click', () => {
            ipcRenderer.send('button-click');
        });
    `).catch(console.error);;
    });

    // Dispose window when closed
    win.on('closed', () => {
        win = null;
    });
}

app.whenReady().then(() => {
    createWindow();

    // Handle the button click event within the main process (Node.js)
    ipcMain.on('button-click', () => {
        CallPowershell();
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
}
});



// app.whenReady().then(() => {
//     createWindow()
// })

// app.whenReady().then(() => {
//     CallPowershell()
// })


















// const Powershell = require ("powershell");

// // start the process
// let ps = new Powershell ("echo 'powershell is awesome'");

// // Handle process errors (e.g. powershell not found)
// ps.on("error", err => {
//     console.error(err);
// })

// const { exec } = require('child_process');

// exec('powershell.exe -Command "Your-PowerShell-Command"', (error, stdout, stderr) => {
//     if (error) {
//         console.error(`exec error: ${error}`);
//         return;
//     }

//     console.log(`stdout: ${stdout}`);
//     console.error(`stderr: ${stderr}`);
// });
