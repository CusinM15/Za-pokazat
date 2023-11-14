using FerryWPF.Business.Repositories;
using FerryWPF.Business.Services;
using FerryWPF.Business.VievModel;
using FerryWPF.Business.View;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Windows;

namespace FerryWPF
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private readonly IServiceProvider _serviceProvider;

        public App()
        {
            IServiceCollection services = new ServiceCollection();
            _ = services.AddSingleton<MainVievModel>();

            _ = services.AddSingleton(s => new MainWindovPort(
                  s.GetRequiredService<MainVievModel>()
                  ));
            _ = services.AddSingleton<IGenericRepository>(s => new GenericRepository());
            _ = services.AddSingleton<IPortService>(s => new PortService(s.GetRequiredService<GenericRepository>()));
            _serviceProvider = services.BuildServiceProvider();
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            MainWindovPort MainWindovPortStart = _serviceProvider.GetRequiredService<MainWindovPort>();
            MainWindovPortStart.Show();

            base.OnStartup(e);
        }
    }
}
