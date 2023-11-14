using FerryWPF.Business.VievModel;
using System.Windows;

namespace FerryWPF.Business.View
{
    public partial class MainWindovPort : Window
    {
        private readonly MainVievModel _viewModel;

        public MainWindovPort(MainVievModel viewModel)
        {
            InitializeComponent();
            _viewModel = viewModel;
            // The DataContext serves as the starting point of Binding Paths
            DataContext = _viewModel;
        }
    }
}
