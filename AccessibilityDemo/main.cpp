#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>

#include "AppModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickView* view = new QQuickView();
    QQmlContext *ctxt = view->rootContext();

    AppModel appModel;
    ctxt->setContextProperty(QStringLiteral("appModel"), &appModel);

    view->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view->create();
    view->show();

    return app.exec();
}
