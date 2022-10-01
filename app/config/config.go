package config

import (
	_bo "Office-Booking/domain/booking"
	_ge "Office-Booking/domain/gedung"
	_je "Office-Booking/domain/jenisgedung"
	_ne "Office-Booking/domain/nearby"
	_re "Office-Booking/domain/review"
	_us "Office-Booking/domain/users"
	"fmt"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

type Config struct {
	DB_Username string
	DB_Password string
	DB_Port     string
	DB_Host     string
	DB_Name     string
}

func InitDB() *gorm.DB {
	config := Config{
		DB_Username: os.Getenv("DB_Username"),
		DB_Password: os.Getenv("DB_Password"),
		DB_Port:     os.Getenv("DB_Port"),
		DB_Host:     os.Getenv("DB_Host"),
		DB_Name:     os.Getenv("DB_Name"),
	}

	connectionString := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=True&loc=Local",

		config.DB_Username,
		config.DB_Password,
		config.DB_Host,
		config.DB_Port,
		config.DB_Name,
	)

	var err error
	DB, err = gorm.Open(mysql.Open(connectionString), &gorm.Config{})
	if err != nil {
		panic(err)
	}

	InitialMigration()

	return DB
}

func InitialMigration() {
	DB.AutoMigrate(
		&_us.User{},
		&_ge.Gedung{},
		&_je.Jenisgedung{},
		&_ne.Nearby{},
		&_re.Review{},
		&_bo.Booking{},
	)
}
