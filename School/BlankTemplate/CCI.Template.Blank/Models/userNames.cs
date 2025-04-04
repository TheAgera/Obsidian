﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.System.UserProfile;
using System.DirectoryServices.AccountManagement;
using System.DirectoryServices;
using System.Windows.Controls;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace CCI.Template.Blank.Models
{
    static class userNames
    {
        public static ObservableCollection<DirectoryEntry> ADUserCollection = new ObservableCollection<DirectoryEntry>();
        public static ObservableCollection<string> TypedUser = new ObservableCollection<string>();
        public static ObservableCollection<InputUser> inputUsers = new ObservableCollection<InputUser>();
        public static ObservableCollection<OutputUser> outputUsers = new ObservableCollection<OutputUser>();
    }

    public class UserViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public UserViewModel()
        {
            // Subscribe to the CollectionChanged event of outputUsers
            userNames.outputUsers.CollectionChanged += OutputUsers_CollectionChanged;
        }

        private void OutputUsers_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            OnPropertyChanged(nameof(OutputUsersCount));
        }

        public int OutputUsersCount => userNames.outputUsers.Count;

        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }

    public class PlateSize
    {
        public string? Primary { get; set; }
        public string? Secondary { get; set; }
        public DirectoryEntry? directoryEntry { get; set; }
    }
    public class OutputUser
    {
        public string? First { get; set; }
        public string? Last { get; set; }
        public string? type { get; set; }
    }
    public class  InputUser
    {
        public string? First { get; set; }
        public string? Last { get; set; }
        public string? Department { get; set; }
        public string? Division { get; set; }
        public string? Title { get; set; }
        public string? UserType { get; set; }
    
    }
}

