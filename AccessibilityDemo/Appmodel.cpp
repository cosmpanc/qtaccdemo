#include "AppModel.h"
#include <QAccessible>

AppModel::AppModel()
{
}

Q_INVOKABLE void AppModel::announceText(QQuickItem* item, const QString& text)
{
    // This works even for items that don't have a Value property
    // e.g. items with role QAccessible::StaticText
    QAccessibleValueChangeEvent event(item, QAccessible::ValueChanged);
    event.setValue(text);
    QAccessible::updateAccessibility(&event);

    // Debug: verify iface is the expected item and that
    // isActive is true. If isActive is false, means no
    // listener (Screen Reader) is connected so the event won't fire.
    QAccessibleInterface* iface = QAccessible::queryAccessibleInterface(item);
    qDebug() << "Event: " << iface << " " << text << " isActive: " << QAccessible::isActive();
}
