#include "work.h"



work::work(QObject  *parent)
    : QObject(parent),
      m_speed(100),
      max_range(50)
{
    Timer = new QTimer(this);
    connect(Timer, &QTimer::timeout, this, &work::setCircleTime);
}



void work::setCircleTime() {

    if (max_range < m_point.x()){
        max_range = m_point.x() ;
        emit maxrangeChanged();
    }
    m_point.setX(m_point.x()+0.1);
    float val = sin(m_point.x());
    m_point.setY(val);
    emit pointChanged();
}


void work::speed(int value)
{
    m_speed = value;

}

float work::maxrange()
{
    return max_range;
}

void work::stop()
{

    Timer->stop();

}

void work::start()
{
    Timer->start(m_speed);
}



