   M S B A M L   `   `   `  ����C  ?FerryWPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:FerryWPF.Business.VievModelFerryWPF.Business.VievModel  5   	   %    FerryWPF.Business.View.Terminal   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   8VM)clr-namespace:FerryWPF.Business.VievModel     5   	     � Title$  Terminal��5   	   $	��550��6   $
��1200��6'    � Icon$ 	Ferry.png��64   .��5      �  � ColumnDefinitions 5   
   �� 5      $��20 �6   �� 5      $��* �6   �� 5      $��50 �6    � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��* �6   �� 5      $	��100 �6   .+�5   
   &   System.Windows.Controls.DataGrid  $��30(�6      MinRowHeight$ 59Q�6!   $��1��63   $��2��6C   $��3��6W      AlternatingRowBackground
 �����   GridLinesVisibility$
 None=�6�      AutoGenerateColumns .     CanUserAddRows .  $��10,50,40,103q�5   h   ��6   �� *
ListText+	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      
   	FontStyle$
 Italic$�6%   ,  &System.Windows.Controls.DataGridColumn   Header$ Terminal��68   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6J   �� *TextParameter+5      �� 5   
   -   5         ��Name$ startBTN��5      $��1��6#   $��2��63   $��START��6@   $��
805,0,40,0q�5   /   $��2��6C   ��5   P   �� *GoToCommand+{�5      �� *	HideBtn+6C   �� 5   
    �� ContentStringFormat$ c��61    � Language$ sl-si�6I   $��1��6[   $
��Left=�6k   $��52��6�   $��153,58,0,-2q�6�   $��2��6�   $	��top=�5       $	��172��6(   ��5      �� *WorkerSalary+5    (   �� 5!   
   $��Worker's salary:��6   $��1��6+   $
��Left=�6;   $��	10,58,0,0q�6V   $��6��6i   $	��Top=�5"      $��39��6(   $	��159��64   �� 5#   
   $ c��6;   $ sl-si�6S   $��1��6d   $
��Left=�6t   $��52��6�   $��153,18,0,-2q�6�   $��2��6�   $	��top=�5$      $	��172��6(   ��5#      �� *WorkerSalary_ThisMonth+5$   (   �� 5%   
   $��Salary of this month:��6   $��1��60   $
��Left=�6@   $��	10,18,0,0q�6[   $��6��6n   $	��Top=�5&      $��39��6(   $	��159��64   5)      5*      