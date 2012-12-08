//
//  Define.h
//  Defence
//
//  Created by bryce on 12-12-2.
//
//

#ifndef Defence_Define_h
#define Defence_Define_h


typedef struct _Vector {
    float x_;
    float y_;
}Vec2;
static inline Vec2 makeVec2(float x,float y)
{
    Vec2 v = {x,y};
    return v;
}


#endif
