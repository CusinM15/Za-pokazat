using FerryWPF.Business.VievModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using System.Windows.Threading;

namespace FerryWPF.Business.View
{
    /// <summary>
    /// Interaction logic for Terminal.xaml
    /// </summary>
    public partial class Terminal : Window
    {
        private Label[] labels;
        private int currentLabelIndex = 0;
        private DispatcherTimer timer;
        private readonly TerminallViewModel _viewModel;
        public Terminal()
        {
            InitializeComponent();

            _viewModel = new TerminallViewModel();
            // The DataContext serves as the starting point of Binding Paths
            DataContext = _viewModel;
        }
    }
}
