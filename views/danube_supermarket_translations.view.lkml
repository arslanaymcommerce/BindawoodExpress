view: danube_supermarket_translations {
  sql_table_name: public.danube_supermarket_translations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: Name_custom_sort {
    label: "SuperMarket Name"
    case: {
      when: {
        sql: ${name} = 'Red Sea Mall' ;;
        label: "Red Sea Mall"
      }
      when: {
        sql: ${name} = 'Al Salam Mall' ;;
        label: "Al Salam Mall"
      }
      when: {
        sql: ${name} = 'Al Safa' ;;
        label: "Al Safa"
      }
      when: {
        sql: ${name} = 'Al-Serafi Mall' ;;
        label: "Al-Serafi Mall"
      }
      when: {
        sql: ${name} = 'Panorama Mall' ;;
        label: "Panorama Mall"
      }
      when: {
        sql: ${name} = 'Aqeeq' ;;
        label: "Aqeeq"
      }
      when: {
        sql: ${name} = 'Nakhla Center' ;;
        label: "Nakhla Center"
      }
      when: {
        sql: ${name} = 'AlBuhaira' ;;
        label: "AlBuhaira"
      }
      when: {
        sql: ${name} = 'Ebn Jumaah Center' ;;
        label: "Ebn Jumaah Center"
      }
      when: {
        sql: ${name} = 'Nuzha' ;;
        label: "Nuzha"
      }
      when: {
        sql: ${name} = 'Khamis Mushait' ;;
        label: "Khamis Mushait"
      }
      when: {
        sql: ${name} = 'Tera Mall' ;;
        label: "Tera Mall"
      }
      when: {
        sql: ${name} = 'Al Rawabi plaza' ;;
        label: "Al Rawabi plaza"
      }
      when: {
        sql: ${name} LIKE '%Al Badi%' ;;
        label: "Al Badiah Plaza"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Jed' ;;
        label: "Click Toys - Jed"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - East' ;;
        label: "Click Toys - East"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Riyadh' ;;
        label: "Click Toys - Riyadh"
      }

    }
    hidden: no
  }

  dimension: Name_custom_sort_New {
    label: "SuperMarket Name_New"
    case: {
      when: {
        sql: ${name} = 'Red Sea Mall' ;;
        label: "Red Sea Mall"
      }
      when: {
        sql: ${name} = 'Al Salam Mall' ;;
        label: "Al Salam Mall"
      }
      when: {
        sql: ${name} = 'Al Safa' ;;
        label: "Thaylia 2"
      }
      when: {
        sql: ${name} = 'Al-Serafi Mall' ;;
        label: "Al-Serafi Mall"
      }
      when: {
        sql: ${name} = 'Panorama Mall' ;;
        label: "Panorama Mall"
      }
      when: {
        sql: ${name} = 'Aqeeq' ;;
        label: "Aqeeq"
      }
      when: {
        sql: ${name} = 'Nakhla Center' ;;
        label: "Nakhla Center"
      }
      when: {
        sql: ${name} = 'AlBuhaira';;
        label: "AlBuhaira"
      }
      when: {
        sql: ${name} = 'Ebn Jumaah Center'  ;;
        label: "Ebn Jumaah Center"
      }
      when: {
        sql: ${name} = 'Nuzha' ;;
        label: "Abha"
      }
      when: {
        sql: ${name} = 'Khamis Mushait' ;;
        label: "Khamis Mushait"
      }
      when: {
        sql: ${name} = 'Tera Mall' ;;
        label: "Tera Mall"
      }
      when: {
        sql: ${name} = 'Al Rawabi plaza' ;;
        label: "Al Rawabi plaza"
      }
      when: {
        sql: ${name} LIKE '%Al Badi%' ;;
        label: "Al Badiah Plaza"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Jed' ;;
        label: "Click Toys - Jed"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - East' ;;
        label: "Click Toys - East"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Riyadh' ;;
        label: "Click Toys - Riyadh"
      }

    }
    hidden: no
  }

  dimension: Region {
    case: {
      when: {
        sql: ${name} in  ('Hira Branch','Aya Mall Branch','Al Salam Mall Branch','Al Falah Branch','Safa Branch',' Al Falah Branch','Aziziya Branch - MAK') ;;
        label: "Western South"
      }
      when: {
        sql: ${name} in  ('AlAqeeq Branch','Al Badiyah Branch','Al Rawabi Branch','Al Andalus Branch','Green Oasis Branch','Hittin Branch');;
        label: "Central"
      }
      when: {
        sql: ${name} in  ('Al Yarmouk Branch','Al Raaka Branch','Al Aziziyah Branch','Buhaira Branch','Al Aziziyah Branch - KHU','Ebn Jumaah Branch');;
        label: "Eastern"
      }
    }
    hidden: no
  }

  dimension: supermarket_ID {
    case: {
      when: {
        sql: ${name} = 'Red Sea Mall' ;;
        label: "122"
      }
      when: {
        sql: ${name} = 'Al Salam Mall' ;;
        label: "128"
      }
      when: {
        sql: ${name} = 'Al Safa' ;;
        label: "160"
      }
      when: {
        sql: ${name} = 'Al-Serafi Mall' ;;
        label: "115"
      }
      when: {
        sql: ${name} = 'Panorama Mall' ;;
        label: "125"
      }
      when: {
        sql: ${name} = 'Aqeeq' ;;
        label: "147"
      }
      when: {
        sql: ${name} = 'Nakhla Center' ;;
        label: "132"
      }
      when: {
        sql: ${name} = 'AlBuhaira';;
        label: "151"
      }
      when: {
        sql: ${name} = 'Ebn Jumaah Center'  ;;
        label: "130"
      }
      when: {
        sql: ${name} = 'Nuzha' ;;
        label: "140"
      }
      when: {
        sql: ${name} = 'Khamis Mushait' ;;
        label: "137"
      }
      when: {
        sql: ${name} = 'Tera Mall' ;;
        label: "162"
      }
      when: {
        sql: ${name} = 'Al Rawabi plaza' ;;
        label: "154"
      }
      when: {
        sql: ${name} LIKE '%Al Badi%' ;;
        label: "152"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Jed' ;;
        label: "85"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - East' ;;
        label: "124"
      }
      when: {
        sql: ${name} LIKE 'Click Toys - Riyadh' ;;
        label: "86"
      }

    }
    hidden: no
  }

  dimension: store_mobile_no {
    case: {
      when: {
        sql: ${name} = 'Red Sea Mall' ;;
        label: "0540206579"
      }
      when: {
        sql: ${name} = 'Al Salam Mall' ;;
        label: "0540206792"
      }
      when: {
        sql: ${name} = 'Al Safa' ;;
        label: "0540206692"
      }
      when: {
        sql: ${name} = 'Al-Serafi Mall' ;;
        label: "0540206904,0566055751"
      }
      when: {
        sql: ${name} = 'Panorama Mall' ;;
        label: "0540209601"
      }
      when: {
        sql: ${name} = 'Aqeeq' ;;
        label: "0540209075"
      }
      when: {
        sql: ${name} = 'Nakhla Center' ;;
        label: "0540252983"
      }
      when: {
        sql: ${name} = 'AlBuhaira';;
        label: "0540209548,0549333778"
      }
      when: {
        sql: ${name} = 'Ebn Jumaah Center'  ;;
        label: "0533942895,0540910037"
      }
      when: {
        sql: ${name} = 'Nuzha' ;;
        label: "NA"
      }
      when: {
        sql: ${name} = 'Khamis Mushait' ;;
        label: "NA"
      }
      when: {
        sql: ${name} = 'Tera Mall' ;;
        label: "0540207305"
      }
      when: {
        sql: ${name} = 'Al Rawabi plaza' ;;
        label: "0540209216"
      }
      when: {
        sql: ${name} LIKE '%Al Badi%' ;;
        label: "NA"
      }
    }
    hidden: no
  }
  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: danube_supermarket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.danube_supermarket_id ;;
  }

  dimension: DarkStore_Code {
    case: {
      when: {
        sql: ${danube_supermarket_id} in (98) ;;
        label: "57011"
      }
      when: {
        sql: ${danube_supermarket_id}  = 20 ;;
        label: "9"
      }
      when: {
        sql: ${danube_supermarket_id}  = 24 ;;
        label: "41"
      }
      when: {
        sql: ${danube_supermarket_id}  = 99 ;;
        label: "40"
      }
      when: {
        sql: ${danube_supermarket_id}  = 101 ;;
        label: "4"
      }
      when: {
        sql: ${danube_supermarket_id}  = 102 ;;
        label: "16"
      }
      when: {
        sql: ${danube_supermarket_id}  = 103 ;;
        label: "21"
      }
      when: {
        sql: ${danube_supermarket_id}  = 104 ;;
        label: "36"
      }
      when: {
        sql: ${danube_supermarket_id}  = 18 ;;
        label: "03"
      }

    }
    hidden: no
  }


  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, danube_supermarkets.name, danube_supermarkets.id]
  }
}
