using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LoginDemo.Controllers
{
    public class InfoModel 
    {

        public InfoModel()
        {
        }
        /// <summary>
        ///主键
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 任务名
        /// </summary>
        public string InfoName { get; set; }
        /// <summary>
        /// 任务内容
        /// </summary>
        public string InfoContent { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateDate { get; set; }
        /// <summary>
        /// 提醒时间
        /// </summary>
        public string AlertDate1 { get; set; }
        /// <summary>
        /// 提醒时间
        /// </summary>
        public string AlertDate2 { get; set; }

        /// <summary>
        /// 提醒时间
        /// </summary>
        public string AlertDate3 { get; set; }

        /// <summary>
        /// 提醒时间
        /// </summary>
        public string AlertDate4 { get; set; }

        /// <summary>
        /// 提醒时间
        /// </summary>
        public string AlertDate5 { get; set; }

    }
}
