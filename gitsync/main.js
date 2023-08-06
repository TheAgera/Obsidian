const { app, BrowserWindow } = require('electron')

function createWindow () {
    
    let win = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            nodeIntegration: false,
            contextIsolation: true,
            preload: Path2D.join(__dirname, 'preload.js')
        }
        
    })

    win.loadFile('index.html').then(() => {
        win.webContents.openDevTools();
        win.webContents.executeJavaScript(`
        const { exec } = require ('childprocess');
        const $ = require('jquery'); 
        
        $(document).ready(function() {
            $('#myButton').click(function() {
                let Scriptpath = "C:\\Users\\ksuess\\Documents\\gitsync\\electronjs.ps1";
                let Scriptparameter = "2";

                let cmd = \`powershell.exe -File "\${Scriptpath}" -test "\${Scriptparameter}"\`;

                exec(cmd, (error,stdout,stderr) => {
                    if (error) {
                        console.error(\`exec error: \$\{error}\`);
                        return;
                    }
                    console.log(\`stdout: \$\{stdout}\`);
                    console.error(\`stderr: \$\{stderr}\`);
                });
            });
        });
    `).catch(error => {
        console.error('Failed to execute script:', error);
    });
}).catch(error => {
    console.error('Failed to load file:', error);
});

}
app.whenReady().then(() => {
    createWindow()


    // app.on('activate', () => {
    //     if (BrowserWindow.getAllWindows().length === o){
    //         createWindow()
    //     }
    // })
});

// app.on('window-all-closed', () => {
//     if (ProcessingInstruction.platform !== 'darwin') {
//         app.quit()
//     }
// })