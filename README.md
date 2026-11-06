# Запуск проекта Plusone (Development / Production)

В проекте предусмотрено два окружения: **Dev** для локальной разработки и тестирования и **Prod** для работы с сервером Render.

## 1. Dev — локальная разработка

Используется при разработке Flutter-приложения и тестировании на Android-эмуляторе.

### Архитектура

- Flutter запускается на Android-эмуляторе.
- Go Backend запускается локально на компьютере.
- PostgreSQL запускается локально на компьютере.

### Настройки локальной базы данных

В файле `config/.env.dev`:

```env
PG_DB=plusonedb
PG_USER=postgres
PG_PASSWORD=postgres
PG_HOST=localhost
PG_PORT=5432
PG_SSLMODE=disable
```

Перед запуском необходимо убедиться, что локальный PostgreSQL запущен и база данных `plusonedb` создана.

### Запуск Backend

Открыть терминал PowerShell в папке `lib/backend`:

```powershell
$env:APP_ENV = "dev"
go run ./cmd/app
```

Backend будет доступен по адресу:

`http://localhost:9000`

### Запуск Flutter

В файле `api_config.dart` по умолчанию указан локальный адрес:

```dart
const String baseUrl = String.fromEnvironment(
  'BASE_URL',
  defaultValue: 'http://10.0.2.2:9000',
);
```

Запустить приложение на Android-эмуляторе:

```powershell
flutter run
```

**Важно:** `10.0.2.2` — специальный адрес Android-эмулятора, позволяющий обращаться к локальному компьютеру. Не заменять его на `localhost` при запуске на эмуляторе.

---

## 2. Prod — запуск с Render

Используется для проверки приложения с production-сервером или создания production-сборки.

### Архитектура

- Flutter обращается к Go Backend на Render.
- Go Backend на Render подключается к PostgreSQL на Render.

### Настройки Backend

В Render → Go Service → Environment должны быть заданы переменные окружения:

```env
APP_ENV=prod
PG_DB=имя_базы_Render
PG_USER=пользователь_Render
PG_PASSWORD=пароль_Render
PG_HOST=хост_Render
PG_PORT=5432
PG_SSLMODE=require
```

Значения PostgreSQL берутся из настроек базы данных Render.

### Запуск Flutter с Production API

Для запуска приложения на эмуляторе с production-сервером:

```powershell
flutter run --dart-define=BASE_URL=https://plusone-xw72.onrender.com
```

### Сборка Production APK

```powershell
flutter build apk --release --dart-define=BASE_URL=https://plusone-xw72.onrender.com
```

Готовый APK находится по пути:

`build/app/outputs/flutter-apk/app-release.apk`

---

## 3. Сравнение окружений

| Параметр | Dev | Prod |
|---|---|---|
| Flutter API URL | `http://10.0.2.2:9000` | `https://plusone-xw72.onrender.com` |
| Go Backend | Локальный | Render |
| PostgreSQL | Локальный | Render |
| SSL PostgreSQL | `disable` | `require` |
| Режим Backend | `dev` | `prod` |

## 4. Важные замечания

1. Для локальной разработки необходимо запускать PostgreSQL, затем Go Backend и после этого Flutter-приложение.
2. При использовании Production API локальный Go Backend запускать не нужно.
3. Flutter-приложение подключается только к Go Backend. Прямого подключения Flutter к PostgreSQL нет.
4. Файл `.env.dev` содержит локальные настройки и пароли. Он должен находиться в `.gitignore` и не попадать в GitHub.
5. Production-переменные окружения хранятся в настройках Render, а не в исходном коде проекта.
6. При переключении между окружениями необходимо учитывать, с какой базой данных работает Backend: тестовые данные Dev и Prod хранятся отдельно.