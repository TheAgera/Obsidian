// This Source Code Form is subject to the terms of the MIT License.
// If a copy of the MIT was not distributed with this file, You can obtain one at https://opensource.org/licenses/MIT.
// Copyright (C) Leszek Pomianowski and WPF UI Contributors.
// All Rights Reserved.

using CCI.Template.Blank.Views.Pages;
using Wpf.Ui;
using Wpf.Ui.Appearance;



namespace CCI.Template.Blank.main;
/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow
{
    public MainWindow()
    {
        DataContext = this; 
        Wpf.Ui.Appearance.SystemThemeWatcher.Watch(this);
        InitializeComponent();
        
        Loaded += (_, _) => RootNavigation.Navigate(typeof(HomePage));
    }

    
}
