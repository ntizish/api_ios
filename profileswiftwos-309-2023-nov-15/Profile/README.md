#  Задание

Разработать iOS-приложение на Swift c UIKit и версткой кодом - профиль пользователя.
На главном экране отображаются: фото (или аватар по-умолчанию), фамилия, имя, отчество,  никнейм, имейл, телефон, телеграмм. При нажатии на аватар, вызывается нативное окно для выбора фото из галереи / получения нового фото путем фотографирования и сохранения в файловой системе приложения. При нажатии на поля пользователю предоставляется возможность отредактировать их и сохранить или отменить изменения. После перезапуска приложения ранее сохраненные данные профиля пользователя должны подгружаться и отображаться на данном экране.


в дизайне использовать два цвета - черный и белый

комментировать код


Weather JSON 
{
    "request": {
        "type": "City",
        "query": "New York, United States of America",
        "language": "en",
        "unit": "m"
    },
    "location": {
        "name": "New York",
        "country": "United States of America",
        "region": "New York",
        "lat": "40.714",
        "lon": "-74.006",
        "timezone_id": "America/New_York",
        "localtime": "2019-09-07 08:14",
        "localtime_epoch": 1567844040,
        "utc_offset": "-4.0"
    },
    "current": {
        "observation_time": "12:14 PM",
        "temperature": 13,
        "weather_code": 113,
        "weather_icons": [
            "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png"
        ],
        "weather_descriptions": [
            "Sunny"
        ],
        "wind_speed": 0,
        "wind_degree": 349,
        "wind_dir": "N",
        "pressure": 1010,
        "precip": 0,
        "humidity": 90,
        "cloudcover": 0,
        "feelslike": 13,
        "uv_index": 4,
        "visibility": 16
    }
}
