#include <QGuiApplication>
//#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlEngine>
//#include <QQmlFileSelector>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQuickView view;
    view.connect(view.engine(), &QQmlEngine::quit, &app, &QCoreApplication::quit);
    //new QQmlFileSelector(view.engine(), &view);
    view.setSource(QUrl("qrc:/game.qml"));
    if (view.status() == QQuickView::Error)
        return -1;
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();

    //QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/game.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
