//
//  BrazilMapContainer.m
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 16/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "MapOverlay.h"

//deve ser true apenas para debug
//setar true para que as zonas de toque sejam desenhadas na tela
#define drawStateTouchZones true

@interface MapOverlay ()

//as chaves sao as areas de toque (UIBezierPath) e os valores a sigla do estado (NSString)
//TODO: criar um model de Estado e utilizar como valor
@property (strong, nonatomic) NSDictionary *stateForPath;

@end

@implementation MapOverlay

#pragma mark INIT

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //reconhecimento de gestos
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        
        [self addGestureRecognizer:tapRecognizer];
        
        //fundo transparente
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
        [self initPaths];
        
    }
    return self;
}

//inicializa areas de toque
-(void)initPaths {
    
    NSMutableDictionary *stateNameForPath = [[NSMutableDictionary alloc] init];
    
    CGFloat offsetX = self.bounds.size.width;
    CGFloat offsetY = self.bounds.size.height;
    
    CGMutablePathRef path;
    UIBezierPath *bezPath;
    
    //RS:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, offsetX - 519, offsetY - 8);
    CGPathAddLineToPoint(path, NULL, offsetX - 603, offsetY - 111);
    CGPathAddLineToPoint(path, NULL,  offsetX - 496, offsetY - 175);
    CGPathAddLineToPoint(path, NULL, offsetX - 421, offsetY - 98);
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"RS" forKey:bezPath];
    
    CGPathRelease(path);
    
    //SC:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, offsetX - 604, offsetY - 117);
    CGPathAddLineToPoint(path, NULL, offsetX - 505, offsetY - 177);
    CGPathAddLineToPoint(path, NULL, offsetX - 508, offsetY - 198);
    CGPathAddLineToPoint(path, NULL, offsetX - 566, offsetY - 189);
    CGPathAddLineToPoint(path, NULL,  offsetX - 632, offsetY - 200);
    CGPathAddLineToPoint(path, NULL, offsetX - 628 , offsetY - 143);
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"SC" forKey:bezPath];
    
    CGPathRelease(path);
    
    //PR:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(632 - offsetX), -(201 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(514 - offsetX), -(196 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(487 - offsetX), -(215 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(497 - offsetX), -(249 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(530 - offsetX), -(287 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(603 - offsetX), -(279 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"PR" forKey:bezPath];
    
    CGPathRelease(path);
    
    //SP:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(643 - offsetX), -(220 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(602 - offsetX), -(278 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(533 - offsetX), -(292 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(581 - offsetX), -(353 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(660 - offsetX), -(348 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(685 - offsetX), -(278 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(696 - offsetX), -(276 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(718 - offsetX), -(288 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(716 - offsetX), -(265 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"SP" forKey:bezPath];
    
    CGPathRelease(path);
    
    //RJ:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(721 - offsetX), -(290 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(721 - offsetX), -(270 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(781 - offsetX), -(270 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(807 - offsetX), -(289 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(810 - offsetX), -(312 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(790 - offsetX), -(324 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(770 - offsetX), -(299 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"RJ" forKey:bezPath];
    
    CGPathRelease(path);
    
    //ES:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(810 - offsetX), -(313 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(792 - offsetX), -(325 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(819 - offsetX), -(362 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(817 - offsetX), -(386 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(830 - offsetX), -(395 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(849 - offsetX), -(385 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(845 - offsetX), -(352 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"ES" forKey:bezPath];
    
    CGPathRelease(path);
    
    //MG:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(664 - offsetX), -(352 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(695 - offsetX), -(285 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(765 - offsetX), -(305 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(832 - offsetX), -(441 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(735 - offsetX), -(479 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(685 - offsetX), -(444 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(645 - offsetX), -(380 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(600 - offsetX), -(375 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(585 - offsetX), -(364 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"MG" forKey:bezPath];
    
    CGPathRelease(path);
    
    //MS:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(499 - offsetX) , -(262 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(572 - offsetX) , -(351 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(446 - offsetX) , -(415 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(396 - offsetX) , -(309 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"MS" forKey:bezPath];
    
    CGPathRelease(path);
    
    //MT:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(521 - offsetX) , -(410 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(365 - offsetX) , -(456 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(374 - offsetX) , -(574 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(339 - offsetX) , -(598 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(350 - offsetX) , -(627 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(586 - offsetX) , -(601 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"MT" forKey:bezPath];
    
    CGPathRelease(path);
    
    //GO:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(627 - offsetX) , -(460 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(690 - offsetX) , -(490 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(686 - offsetX) , -(514 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(601 - offsetX) , -(520 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(534 - offsetX) , -(408 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(573 - offsetX) , -(381 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(653 - offsetX) , -(405 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(656 - offsetX) , -(429 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"GO" forKey:bezPath];
    
    CGPathRelease(path);
    
    //DF:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(646 - offsetX) , -(467 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(670 - offsetX) , -(467 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(668 - offsetX) , -(451 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(645 - offsetX) , -(450 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"DF" forKey:bezPath];
    
    CGPathRelease(path);
    
    //TO:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(695 - offsetX) , -(531 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(594 - offsetX) , -(547 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(658 - offsetX) , -(710 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"TO" forKey:bezPath];
    
    CGPathRelease(path);
    
    //AC:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(186 - offsetX), -(599 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(120 - offsetX), -(579 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(103 - offsetX), -(613 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(47 - offsetX), -(610 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(18 - offsetX), -(660 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"AC" forKey:bezPath];
    
    CGPathRelease(path);
    
    //AM:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(440 - offsetX), -(794 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(383 - offsetX), -(663 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(263 - offsetX), -(654 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(193 - offsetX), -(612 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(37 - offsetX), -(664 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(119 - offsetX), -(738 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(139 - offsetX), -(854 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(269 - offsetX), -(865 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(305 - offsetX), -(806 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(378 - offsetX), -(825 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"AM" forKey:bezPath];
    
    CGPathRelease(path);
    
    //RO:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(351 - offsetX), -(569 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(341 - offsetX), -(522 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(237 - offsetX), -(562 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(237 - offsetX), -(611 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(279 - offsetX), -(636 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(310 - offsetX), -(621 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(314 - offsetX), -(572 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"RO" forKey:bezPath];
    
    CGPathRelease(path);
    
    //RR:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(377 - offsetX), -(871 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(308 - offsetX), -(836 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(296 - offsetX), -(906 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(260 - offsetX), -(932 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(347 - offsetX), -(959 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"RR" forKey:bezPath];
    
    CGPathRelease(path);
    
    //PA:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(595 - offsetX), -(614 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(437 - offsetX), -(628 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(408 - offsetX), -(684 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(462 - offsetX), -(797 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(394 - offsetX), -(869 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(478 - offsetX), -(894 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(559 - offsetX), -(812 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(587 - offsetX), -(844 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(620 - offsetX), -(827 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(625 - offsetX), -(792 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(670 - offsetX), -(820 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(691 - offsetX), -(811 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"PA" forKey:bezPath];
    
    CGPathRelease(path);
    
    //AP:
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, -(559 - offsetX), -(832 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(532 - offsetX), -(885 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(503 - offsetX), -(900 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(542 - offsetX), -(905 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(572 - offsetX), -(946 - offsetY));
    CGPathAddLineToPoint(path, NULL, -(601 - offsetX), -(886 - offsetY));
    
    bezPath = [UIBezierPath bezierPathWithCGPath:path];
    [self closeAndFlipPath:bezPath];
    
    [stateNameForPath setObject:@"AP" forKey:bezPath];
    
    CGPathRelease(path);
    
    //guarda o dicionario como imutável
    _stateForPath = stateNameForPath;
    
}

//metodo auxiliar do initPaths
-(void)closeAndFlipPath:(UIBezierPath*)path {
    
    [path closePath];
    
    CGAffineTransform mirrorOverXOrigin = CGAffineTransformMakeScale(-1.0f, 1.0f);
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.bounds.size.width, 0);
    
    [path applyTransform:mirrorOverXOrigin];
    [path applyTransform:translate];
    
}

#pragma mark Tratamento de Toques

//se o toque foi em uma area de toque conhecida, chama o delegate com o nome do estado
-(void)handleTap:(UITapGestureRecognizer*)recognizer {
    
    if(recognizer.numberOfTouches > 1)
        return;
    
    if(recognizer.state == UIGestureRecognizerStateRecognized) {
        
        CGPoint tapLocation = [recognizer locationInView:self];
        NSLog(@"ponto de estado: %f %f ", tapLocation.x,tapLocation.y);
        for (UIBezierPath *path in self.stateForPath) {
        
            if([path containsPoint:tapLocation]) {
                
                if(self.delegate != nil)
                    [self.delegate tapOnState:[self.stateForPath objectForKey:path]];
                else
                    NSLog(@"Delegate do MapOverlay não setado");
                
            }
        }
    }
}


#pragma mark DEBUG

//desenha a area de toque para cada estado (utilizado para debug)
#if drawStateTouchZones

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setStroke];
    
    for (UIBezierPath *path in self.stateForPath) {
        
        [path stroke];
    }
    
}

#endif

@end
