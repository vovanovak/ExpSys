#pragma once
#include "resource.h"
#include "ObjectHandler.h"
using namespace std;

class ImageHandler
{
public:
	ImageHandler();
	~ImageHandler();
	void click(HWND hwnd);

private:
	ObjectHandler* obj;
};
