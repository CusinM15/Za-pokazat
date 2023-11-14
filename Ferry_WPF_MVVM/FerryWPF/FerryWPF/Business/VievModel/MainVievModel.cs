using FerryWPF.Business.Infractructure;
using FerryWPF.Business.Repositories;
using FerryWPF.Business.Services;
using FerryWPF.Business.View;
using System.Windows;
using System.Windows.Input;

namespace FerryWPF.Business.VievModel
{
    public class MainVievModel : ViewModelBase
    {
        public ICommand GoToCommand { get; set; }
        public MainVievModel()
        {
            GoToCommand = new DelegateCommand(OnChangeName);
        }

        private void OnChangeName(object obj)
        {
            Terminal newWin = new Terminal(new TerminalViewModel(new PortService(new GenericRepository())));
            newWin.Show();
            Window Win = obj as Window;
            Win.Close();
        }
    }
}
