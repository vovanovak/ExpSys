#include "stdafx.h"
#include "ObjectHandler.h"
using namespace std;

ObjectHandler::ObjectHandler()
{
	pointArr = new Point[100];
	objNum = 0;
}

ObjectHandler::~ObjectHandler()
{
}

void ObjectHandler::AddPoint(float x, float y)
{
	Point point;
	point.x = x;
	point.y = y;
	point.z = 0;
	pointArr[objNum++] = point;
}

void ObjectHandler::RemovePoint()
{
	objNum--;
}

int ObjectHandler::getNum()
{
	return objNum;
}
