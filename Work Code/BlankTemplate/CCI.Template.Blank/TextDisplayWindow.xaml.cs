using CCI.Template.Blank.Models;
using System;
using System.Collections.Generic;
using System.IO;
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
using System.Windows.Shapes;
using static System.Net.Mime.MediaTypeNames;

namespace CCI.Template.Blank
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class TextDisplayWindow
    {
        public TextDisplayWindow()
        {
            Wpf.Ui.Appearance.SystemThemeWatcher.Watch(this);
            InitializeComponent();
            FirstNameBox.Text = "Hello :0";
        }

        private void btn_addInputUser(object sender, RoutedEventArgs e)
        {
            InputUser inputUser = new InputUser();
            inputUser.First = FirstNameBox.Text;
            inputUser.Last = LastNameBox.Text;
            inputUser.Department = DepartmentBox.Text;
            inputUser.Division = DivisionBox.Text;
            inputUser.Title = TitleBox.Text;
            inputUser.UserType = "";
            userNames.inputUsers.Add(inputUser);
            this.Close();
        }
    }
}
