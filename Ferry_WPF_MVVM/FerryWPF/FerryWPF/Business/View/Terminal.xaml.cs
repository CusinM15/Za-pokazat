using FerryWPF.Business.VievModel;
using System.Windows;

namespace FerryWPF.Business.View
{
    /// <summary>
    /// Interaction logic for Terminal.xaml
    /// </summary>
    public partial class Terminal : Window
    {
        private readonly TerminalViewModel _viewModel;
        public Terminal(TerminalViewModel viewModel)
        {
            InitializeComponent();

            _viewModel = viewModel;
            // The DataContext serves as the starting point of Binding Paths
            DataContext = _viewModel;
        }
    }
}
