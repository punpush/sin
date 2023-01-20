#ifndef WORK_H
#define WORK_H

#include <QObject>
#include <QTimer>
#include <QTime>
#include <QPointF>
#include <math.h>


class work : public QObject
{   Q_OBJECT

    //Q_PROPERTY(QTime circleTime READ circleTime WRITE setCircleTime NOTIFY circleTimeChanged)
    Q_PROPERTY(QPointF point READ point NOTIFY pointChanged)

public:
    explicit work(QObject  *parent = nullptr);

    QPointF point() {
        return m_point;
    }

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void speed(int value);

    Q_INVOKABLE float maxrange();

signals:

    void speedchanged();
    void pointChanged();
    void maxrangeChanged();

public slots:


    void setCircleTime();


private:

    QPointF     m_point;
    QTimer      *Timer;
    int         m_speed;
    float       max_range;


};

#endif // WORK_H
