using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.Interfaces
{
    public interface IPresentable: IDisposable
    {
        Task Add20Entities();
        Task DeleteEntity();
        Task UpdateEntity();
        Task WhereExample();
        Task ClearTable();
    }
}
