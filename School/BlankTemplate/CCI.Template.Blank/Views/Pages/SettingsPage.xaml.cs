// This Source Code Form is subject to the terms of the MIT License.
// If a copy of the MIT was not distributed with this file, You can obtain one at https://opensource.org/licenses/MIT.
// Copyright (C) Leszek Pomianowski and WPF UI Contributors.
// All Rights Reserved.

using System;
using System.Windows;
using Wpf.Ui.Appearance;
using Wpf.Ui;

namespace CCI.Template.Blank.Views.Pages;
/// <summary>
/// Interaction logic for SettingsPage.xaml
/// </summary>
public partial class SettingsPage
{
    public SettingsPage()
    {
        this.InitializeComponent();

        if (Wpf.Ui.Appearance.ApplicationThemeManager.GetAppTheme() == ApplicationTheme.Dark)
        {
            this.DarkThemeRadioButton.IsChecked = true;
        }
        else
        {
            this.LightThemeRadioButton.IsChecked = true;
        }
    }

    private void OnLightThemeRadioButtonChecked(object sender, RoutedEventArgs e)
    {
        Wpf.Ui.Appearance.ApplicationThemeManager.Apply(ApplicationTheme.Light);
    }

    private void OnDarkThemeRadioButtonChecked(object sender, RoutedEventArgs e)
    {
        Wpf.Ui.Appearance.ApplicationThemeManager.Apply(ApplicationTheme.Dark);
    }

    private string GetAssemblyVersion()
    {
        return System.Reflection.Assembly.GetExecutingAssembly().GetName().Version?.ToString()
            ?? String.Empty;
    }
}
