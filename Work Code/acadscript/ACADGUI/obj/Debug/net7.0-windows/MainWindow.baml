   M S B A M L   `   `   `  ����B  >ACADGUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:ACADGUIACADGUI  5   	       ACADGUI.MainWindow   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:ACADGUI     5   	     � Title$  AutoCAD Script Manager��5   	   $	��450��6(   $	��800��65   .��5	      � .+�5
   
   �� $��AutoCAD Version��6   $
��Left=�6*   $��
103,61,0,0q�6E   $	��Top=�6Y   �� 5   
   $��Script File��6   $
��Left=�6&   $��
99,139,0,0q�6A   $	��Top=�6U   �� 5   
   $��Drawing(s) File��6   $
��Left=�6*   $��
99,202,0,0q�6E   $	��Top=�6Y   �� 5   
   $��Drawing List Preview��6   $
��Left=�6/   $��
545,67,0,0q�6J   $	��Top=�6^   �� 5   
   -   5         ��Name$ ddlacadversion��5      $
��Left=�6+   $��
103,87,0,0q�6F   $	��Top=�6Z   $	��120��6r   �� 5   
   -   5         ��Name$ scrfile��5      $��Button��6"   $
��Left=�63   $��103,165,0,0q�6N   $	��Top=�6c   �� 5   
   -   5        $ dwgsfile��5      $��Button��6#   $
��Left=�64   $��103,233,0,0q�6O   $	��Top=�6d   �� 5   
   -   5         ��Name$ previewWindow��5      $
��Left=�6)   $��103,345,0,0q�6D    �� TextWrapping$
 Wrap=�6Y   $��TextBox��6m   $	��Top=�6|   $	��669��6�   $��49��6�   �� 5   
   -   5        $ dwgslist��5      $
��Left=�6$   $	��200��6?   $��
545,98,0,0q�6L   $
 Wrap=�6`   $�� ��6t   $	��Top=�6|   $	��227��6�   �� 5   
   -   5        $ start��5      $��Button��6    $
��Left=�61   $��103,294,0,0q�6L   $	��Top=�6a   �� 5   
   $��Start��6   $
��Left=�6    $��
99,263,0,0q�6;   $	��Top=�6O   �� 5   
   -   5        $ 	splitdwgs��5      $��Split��6$   $
��Left=�64   $��143,233,0,0q�6O   $	��Top=�6d   �� 5   
   -   5        $ scriptPreview��5      $
��Left=�6)   $��
284,98,0,0q�6D   $
 Wrap=�6X   $	��Top=�6l   $	��236��6�   $	��200��6�   �� 5   
   $��Script Preview��6   $
��Left=�6)   $��
284,67,0,0q�6D   $	��Top=�6X   ${�False��6p   �� 5   
   -	   5         ��Name$ listbox��5      $��319,147,319,185q�6#   5      5      