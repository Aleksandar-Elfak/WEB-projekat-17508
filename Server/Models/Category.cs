using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Server.Models
{
    [Table("Category")]
    public class Category
    {
        [Key]
        [Column("ID")]
        public int ID { get; set; }

        [Column("Name")]
        [MaxLength(255)]
        public string Name { get; set; }

        [Column("Description")]
        [MaxLength(255)]
        public string Description { get; set; }

        public virtual List<Movie> Movies { get; set; }

        [JsonIgnore]
        public Shop Shop { get; set; }
    }
}