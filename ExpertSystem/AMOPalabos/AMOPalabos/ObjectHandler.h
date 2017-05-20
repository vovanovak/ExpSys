#pragma once
#include "resource.h"
#include <vector>
using namespace std;

struct Point
{
	float x, y, z;
};

class ObjectHandler
{
public:
	ObjectHandler();
	~ObjectHandler();
	void AddPoint(float x, float y);
	void RemovePoint();
	int getNum();
	Point* pointArr;

private:
	int objNum;
};
