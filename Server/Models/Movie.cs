using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Server.Models
{
    public class Movie
    {
        [Column("Name")]
        [MaxLength(255)]
        public string Name { get; set; }

        [Key]
        [Column("ID")]
        public int ID { get; set; }

        [Column("Description")]
        [MaxLength(255)]
        public string Description { get; set; }

        [Column("Length")]
        [MaxLength(255)]
        public string Length { get; set; }

        [Column("Score")]
        [MaxLength(255)]
        public string Score { get; set; }

        [Column("Image")]
        [MaxLength(255)]
        public string Image { get; set; }

        [JsonIgnore]
        public Category Category { get; set; }
    }
}