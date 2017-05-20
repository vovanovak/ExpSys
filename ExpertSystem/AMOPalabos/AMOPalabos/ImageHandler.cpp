#include "stdafx.h"
#include "ImageHandler.h"
using namespace std;

ImageHandler::ImageHandler()
{
	obj = new ObjectHandler();
}

ImageHandler::~ImageHandler()
{
}

void ImageHandler::click(HWND hwnd)
{
	POINT pt;
	GetCursorPos(&pt);
	ScreenToClient(hwnd, &pt);
	obj->AddPoint(pt.x, pt.y);
	int n = obj->getNum();
	Point* arr = obj->pointArr;
	if (n >= 3) {
		HDC hdc = GetDC(hwnd);
		for (int i = 0; i < n - 1; i++)
		{
			SelectObject(hdc, GetStockObject(DC_BRUSH));
			SetDCBrushColor(hdc, RGB(0, 0, 0));
			MoveToEx(hdc, arr[i].x, arr[i].y, RGB(0, 0, 0));
			LineTo(hdc, arr[i + 1].x, arr[i + 1].y);
		}
		SelectObject(hdc, GetStockObject(DC_BRUSH));
		SetDCBrushColor(hdc, RGB(0, 0, 0));
		MoveToEx(hdc, arr[n - 1].x, arr[n - 1].y, RGB(0, 0, 0));
		LineTo(hdc, arr[0].x, arr[0].y);		
	}
}
