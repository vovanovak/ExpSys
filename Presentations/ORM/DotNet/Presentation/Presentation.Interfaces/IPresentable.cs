using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.Interfaces
{
    public interface IPresentable: IDisposable
    {
        Task Add10000Entities();
        Task Delete1000Entities();
        Task Update1000Entities();
        Task WhereExample();
        Task ClearTable();
    }
}
