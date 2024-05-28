using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Linq;
using System.DirectoryServices.AccountManagement;
using CCI.Template.Blank.Models;
using CCI.Template.Blank;
using System.DirectoryServices;
using System.Runtime.CompilerServices;
using CsvHelper;
using CsvHelper.Configuration;
using System.IO;
using System.Globalization;
using Microsoft.Win32;
using System.Windows.Interop;
using Microsoft.VisualBasic;
using System.Data;
using System.Windows.Controls.Primitives;
using Json.More;
using System.Diagnostics;

namespace CCI.Template.Blank.Views.Pages
{
    /// <summary>
    /// Interaction logic for NamePlatePage.xaml
    /// </summary>
    public partial class NamePlatePage
    {
        public NamePlatePage()
        {
            InitializeComponent();
           // DG_Names.ItemsSource = userNames.inputUsers;
            DG_OutputUsers.ItemsSource = userNames.outputUsers;
            initializeDataGrid();
            //userNames.inputUsers.Add(new InputUser { First = "Kyler", Last = "Suess", Department = "IT", Division = "Admin", Title = "IT Supp Specialist" , UserType = "Primary"});
            //userNames.inputUsers.Add(new InputUser { First = "Oolong", Last = "Johnson", Department = "Meowment", Division = "Meowvision", Title = "Meow Engineer" , UserType = "Primary" });
        }
        private void initializeDataGrid()
        {
            DG_Names.ItemsSource = "";
            DG_Names.ItemsSource = userNames.inputUsers;
            
        }
        private void initializeGUI()
        {
            
        }
       
        private void b_csvImport(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Multiselect = false;
            openFileDialog.Filter = "*.csv|*.csv";
            bool? result = openFileDialog.ShowDialog();
            if (result == true)
            {
               

                using (var reader = new StreamReader(openFileDialog.FileName))
                using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
                {

                    var records = csv.GetRecords<InputUser>();
                    foreach (var record in records)
                    {
                      userNames.inputUsers.Add(record);
                   }
                }
            }            
        }

        private void LV_Name_LeftUp(object sender, MouseButtonEventArgs e)
        {

        }

        private void LV_Name_RightUp(object sender, MouseButtonEventArgs e)
        {

        }



        private void btn_ADImport(object sender, RoutedEventArgs e)
        {
            userNames.inputUsers.Clear();
            // Define the context for querying Active Directory, PrincipalContext encapsulates domain that operations are performed against,
            using (var context = new PrincipalContext(ContextType.Domain, "CommerceControls.com" , "OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"))
            {
                // Create a user principal object for searching
                using (var searcher = new PrincipalSearcher(new UserPrincipal(context) { Enabled = true}))
                {
                    foreach (var result in searcher.FindAll())
                    {
                       
                        DirectoryEntry de = result.GetUnderlyingObject() as DirectoryEntry;
          
                        InputUser user = new InputUser();
                        user.First = (string?)de.Properties["givenName"].Value;
                        user.Last = (string?)de.Properties["sn"].Value;
                        user.Department = (string?)de.Properties["department"].Value;
                        user.Division = (string?)de.Properties["division"].Value;
                        user.Title = (string?)de.Properties["title"].Value;
                        user.UserType = "";
                        //userNames.ADUserCollection.Add(de);
                        userNames.inputUsers.Add(user);

                    }
                }
            }
        }
        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            MessageBox.Show(e.Changes.ToString());
        }

        // Each row is a collection, the selection of the combobox can set the type of the user, but besides that I am reading the what row it is on.
        // Example: I click add on row three, I take the index of the array and add that to the output user collection 
        private void btn_Add_OutputUser(object sender, RoutedEventArgs e)
        {
            // Cast the sender to a Button
            Button button = (System.Windows.Controls.Button)sender;

            // Find the parent DataGridRow of the Button
            DataGridRow dataGridRow = FindParent<DataGridRow>(button);

            // Get the index of the DataGridRow
            int rowIndex = dataGridRow.GetIndex();

            if (button != null)
            {
                InputUser inputUser = button.DataContext as InputUser;
                var temp = button.TemplatedParent;
                
                if (inputUser != null)
                {
                    if (!string.IsNullOrEmpty(inputUser.UserType))
                    {
                        OutputUser outputUser = new OutputUser();
                        outputUser.First = inputUser.First;
                        outputUser.Last = inputUser.Last;
                        outputUser.type = inputUser.UserType;
                        userNames.outputUsers.Add(outputUser);
                        userNames.inputUsers[rowIndex].UserType = "";
                        initializeDataGrid();
                    }
                    else
                    {
                        MessageBox.Show("No binding found for UserType");
                    }

                }
            }
        }

        // Event handler for ComboBox SelectionChanged event
        private void CB_Sel_Change(object sender, SelectionChangedEventArgs e)
        {
            // Cast the sender to a ComboBox
            var comboBox = (System.Windows.Controls.ComboBox)sender;

            // Find the parent DataGridRow of the ComboBox
            DataGridRow dataGridRow = FindParent<DataGridRow>(comboBox);
            
            // Get the index of the DataGridRow
            int rowIndex = dataGridRow.GetIndex();

            // Retrieve the corresponding InputUser from the userNames collection
            InputUser selectedUser = userNames.inputUsers[rowIndex];

            // Get the selected item from the ComboBox and cast it to ComboBoxItem
            ComboBoxItem selectedItem = (ComboBoxItem)comboBox.SelectedItem;

            // Update the UserType of the selected InputUser
            selectedUser.UserType = (string?)selectedItem.Content;

            // Save the updated InputUser back to the userNames collection
            userNames.inputUsers[rowIndex] = selectedUser;        
        }

        public static Parent FindParent<Parent>(DependencyObject child)
            where Parent : DependencyObject
        {
            DependencyObject parentObject = child;

            //We are not dealing with Visual, so either we need to find parent or
            //get Visual to get parent from Parent Heirarchy.
            while (!((parentObject is System.Windows.Media.Visual)
                    || (parentObject is System.Windows.Media.Media3D.Visual3D)))
            {
                if (parentObject is Parent || parentObject == null)
                {
                    return parentObject as Parent;
                }
                else
                {
                    parentObject = (parentObject as FrameworkContentElement).Parent;
                }
            }

            //We have not found parent yet , and we have now visual to work with.
            parentObject = VisualTreeHelper.GetParent(parentObject);

            //check if the parent matches the type we're looking for
            if (parentObject is Parent || parentObject == null)
            {
                return parentObject as Parent;
            }
            else
            {
                //use recursion to proceed with next level
                return FindParent<Parent>(parentObject);
            }
        }



        private void btn_openSecondWindow(object sender, RoutedEventArgs e)
        {
            try
            {
                TextDisplayWindow textDisplayWindow = new TextDisplayWindow();
                textDisplayWindow.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
        }

        private string ConstructPowerShellCommand(OutputUser user)
        {
            string scriptPath;
            if (user.type.Equals("primary", StringComparison.OrdinalIgnoreCase))
            {
                scriptPath = "C:\\Users\theag\\Downloads\\Swoop.ps1";
            }
            else if (user.type.Equals("secondary", StringComparison.OrdinalIgnoreCase))
            {
                scriptPath = "C:\\Users\\theag\\Downloads\\Rec.ps1";
            }
            else
            {
                throw new ArgumentException("Invalid user type");
            }

            string command = $"-File \"{scriptPath}\" -First \"{user.First}\" -Last \"{user.Last}\"";
            return command;
        }
        private void StartPowerShellProcess(string command)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                FileName = "powershell.exe",
                Arguments = command,
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };
            using (Process process = Process.Start(startInfo))
            {
                using (System.IO.StreamReader reader = process.StandardOutput)
                {
                    string result = reader.ReadToEnd();
                    Console.WriteLine(result);
                }
                process.WaitForExit();
            }
        }
            private void b_generateNames_Click(object sender, RoutedEventArgs e)
        {
            int totalNumber = userNames.outputUsers.Count;
            while (totalNumber > 0)
            {
                if (totalNumber >= 3)
                {
                    int startIndex = totalNumber - 3;
                    int endIndex = totalNumber;
                    // Extract the range
                    OutputUser[] newVariable = userNames.outputUsers.Skip(startIndex).Take(endIndex - startIndex).ToArray();

                    // Construct the PowerShell command string with parameters
                    foreach (OutputUser user in newVariable)
                    {
                        string command = ConstructPowerShellCommand(user);
                        StartPowerShellProcess(command);
                    }
                    
                    totalNumber -= 3;
                    DG_OutputUsers.ItemsSource = null;
                    DG_OutputUsers.ItemsSource = newVariable;
                    MessageBox.Show(totalNumber.ToString());

                    //
                }
                else
                {
                    int startIndex = 0;
                    int endIndex = 0;
                    OutputUser[] newVariable = null;

                    switch (totalNumber)
                    {
                        case 2:
                            startIndex = totalNumber - 2;
                            endIndex = totalNumber;
                            // Extract the range
                            newVariable = userNames.outputUsers.Skip(startIndex).Take(endIndex - startIndex).ToArray();
                            // Construct the PowerShell command string with parameters
                            // Construct the PowerShell command string with parameters
                            foreach (OutputUser user in newVariable)
                            {
                                string command = ConstructPowerShellCommand(user);
                                StartPowerShellProcess(command);
                            }

                            DG_OutputUsers.ItemsSource = null;
                            DG_OutputUsers.ItemsSource = newVariable;

                            MessageBox.Show(totalNumber.ToString(), "You are seeing switch case 2");
                            break;

                        case 1:
                            startIndex = totalNumber - 1;
                            endIndex = totalNumber;
                            // Extract the range
                            newVariable = userNames.outputUsers.Skip(startIndex).Take(endIndex - startIndex).ToArray();

                            DG_OutputUsers.ItemsSource = null;
                            DG_OutputUsers.ItemsSource = newVariable;
                            MessageBox.Show(totalNumber.ToString(), "You are seeing switch case 1");
                            break;

                        case 0:
                            // If total number is 0, we do not need to extract any users
                            
                            MessageBox.Show(totalNumber.ToString(), "You are seeing switch case 0");
                            break;
                    }

                    // set total number to 0 to exit the loop
                    totalNumber = 0;
                    DG_OutputUsers.ItemsSource = null;
                    userNames.outputUsers.Clear();
                }
            }
        }
    }
    
}
