   M S B A M L   `   `   `  ����  gdi_task!    gdi_task.Business.View.Main   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	     � Title$
  DURS��5   	   $	��650��6   $
��1000��6#    � Icon$ logo.png��60   .��5
      �  � ColumnDefinitions 5   
   �� 5      $��10 �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��10 �6    � RowDefinitions 5   
   �� 5      $��10 �6   �� 5      $��70 �6   �� 5      $��* �6   �� 5      $��10 �6   .+�5   
   �� $��1��6   $��1��6!   $��Naloži podatke��6.   $��1��6a   $��1��6u   ��6H   �� *Fill+6u   �� 5   
   $��2��6   $��1��6!   $��Počisti podatke��6.   $��1��6c   $��1��6w   ��6I   �� *Clean+6w   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ SeznamDavcnihZavezancev��5      $��1��64   $��2��6D   $��2��6Q   $��1��6e      AlternatingRowBackground
 ��ح�   AutoGenerateColumns .     CanUserAddRows .  ��6�   �� *seznamZavezancev+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn	   Header$		 Ime��6%   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 62   �� *Ime+  5      $	 Naslov��6%   
 65   �� *Naslov+  5      $	 PrvoCeloStevilo��6%   
 6>   �� *PrvoCeloStevilo+  5      $	 DrugoCeloStevilo��6%   
 6?   �� *DrugoCeloStevilo+  5      $	 RealnoStevilo��6%   
 6<   �� *RealnoStevilo+  5       $
	 Znak��6%   
 63   �� *Znak+  5!      $	 Datum��6%   
 64   �� *Datum+  5"      $	 Oznaka��6%   
 65   �� *Oznaka+5%      5&      5'      