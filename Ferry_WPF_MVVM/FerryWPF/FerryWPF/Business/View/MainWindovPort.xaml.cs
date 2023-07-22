using FerryWPF.Business.VievModel;
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
using System.Windows.Shapes;

namespace FerryWPF.Business.View
{
    public partial class MainWindovPort : Window
    {
        private readonly MainVievModel _viewModel;
        public bool IsVisibleProperty;
        public MainWindovPort()
        {
            InitializeComponent();
            _viewModel = new MainVievModel();
            // The DataContext serves as the starting point of Binding Paths
            DataContext = _viewModel;
            
        }
    }
}
