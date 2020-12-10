#ifndef APPMODEL_H
#define APPMODEL_H

#include <QObject>
#include <QQuickItem>

class AppModel : public QObject
{
    Q_OBJECT
public:
    AppModel();

    Q_INVOKABLE void announceText(QQuickItem* item, const QString& text);
};

#endif // APPMODEL_H
