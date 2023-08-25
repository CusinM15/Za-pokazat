using gdi_task.Business.VievModel;
using System.Windows;

namespace gdi_task.Business.View
{
    public partial class Main : Window
    {
        private readonly MainViewModel _viewModel;
        public Main()
        {
            InitializeComponent();
            _viewModel = new MainViewModel();
            // The DataContext serves as the starting point of Binding Paths
            DataContext = _viewModel;

        }

    }
}
