﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ModelFirstDB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DataBaseContainer : DbContext
    {
        public DataBaseContainer()
            : base("name=DataBaseContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Profile> ProfileSet { get; set; }
        public virtual DbSet<UserCategory> UserCategorySet { get; set; }
        public virtual DbSet<UserRigths> UserRigthsSet { get; set; }
        public virtual DbSet<Operation> OperationSet { get; set; }
        public virtual DbSet<Action> ActionSet { get; set; }
        public virtual DbSet<Asessement> AsessementSet { get; set; }
        public virtual DbSet<Invitation> InvitationSet { get; set; }
    }
}
