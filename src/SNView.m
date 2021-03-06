/* Copyright 2016 gbrueckner.
 *
 * This file is part of Snapp.
 *
 * Snapp is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Snapp is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Snapp.  If not, see <http://www.gnu.org/licenses/>.
 */


#import "SNView.h"


@implementation SNView


- (void)visit:(NSView *)view {

    for (NSView *subview in view.subviews)
        [self visit:subview];

    if ([view isKindOfClass:[NSText class]]) {
        NSText *text = (NSText *) view;
        text.maxSize = NSMakeSize(text.frame.size.width, CGFLOAT_MAX);
        [text invalidateIntrinsicContentSize];
    }
}


- (void)layout {

    [super layout];

    [self visit:self];

    /*for (NSView *subview in self.subviews) {
        if ([subview isKindOfClass:[NSText class]]) {
            NSText *text = (NSText *) subview;
            text.maxSize = NSMakeSize(text.frame.size.width, CGFLOAT_MAX);
            [text invalidateIntrinsicContentSize];
        }
    }*/

    [super layout];
}


@end
