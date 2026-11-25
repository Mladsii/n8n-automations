# n8n-автоматизации

Обезличенные схемы n8n для просмотра структуры. Настройки узлов, credentials, рабочие адреса и внутренние ID удалены; перед запуском потребуется настроить потоки заново. Исходные локальные экспорты сохранены без изменений.

## Полный проект MikoPBX Call Analytics

- [MikoPBX Call Analytics](https://github.com/Mladsii/mikopbx-call-analytics) — дашборд, скриншоты и две обезличенные схемы n8n в одном репозитории. JSON-файлы показывают узлы и связи, параметры удалены; это не готовые к запуску экспорты.

- [RSS-ассистент в Telegram](./rss-telegram-assistant/README.md) — [workflow.json](./rss-telegram-assistant/workflow.json)
  Поток читает RSS-источники, фильтрует и обрабатывает публикации, затем отправляет результаты через Telegram. В экспорте 132 узла; перед запуском проверьте подключённые модели и credentials.

- [AI-анализ звонков MikoPBX](./mikopbx-call-analytics/README.md) — [workflow.json](./mikopbx-call-analytics/workflow.json)
  Основной поток получает записи звонков из MikoPBX, выполняет транскрибацию, классифицирует и суммирует разговоры, формирует документы и передаёт результаты в CRM. Экспорт обезличен; реальные адреса, ключи и идентификаторы нужно задать в n8n.

- [Запуск анализа по менеджерам](./mikopbx-manager-launcher/README.md) — [workflow.json](./mikopbx-manager-launcher/workflow.json)
  Планировщик формирует список сотрудников и запускает дочерний поток анализа для каждого. Имена и внутренние номера в опубликованной копии удалены; настройте список и ID дочернего workflow в своей среде n8n.

- [Telegram-бот для управления агентами ElevenLabs](./elevenlabs-agent-manager/README.md) — [workflow.json](./elevenlabs-agent-manager/workflow.json)
  Бот показывает список голосовых агентов и позволяет менять prompt и приветствие, добавлять текстовые документы и URL в базу знаний. Состояния диалога хранит MySQL; текстовые команды обрабатывает AI-узел. Credentials удалены.

- [Telegram AI-агент с инструментами Bitrix24](./telegram-bitrix-ai-agent/README.md) — [workflow.json](./telegram-bitrix-ai-agent/workflow.json)
  Поток принимает сообщения в Telegram, передаёт их AI-агенту с контекстом диалога и вызывает инструменты Bitrix24 через HTTP. Для запуска заново укажите credentials, webhook и настройки своего портала.


- [Парсер и мониторинг доменов](./domain-parser/README.md) — [workflow.json](./domain-parser/workflow.json), схема на 58 узлов.\n