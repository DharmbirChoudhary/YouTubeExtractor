/* Copyright (c) 2008 Google Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

//
//  GDataSiteKeyword.m
//

#if !GDATA_REQUIRE_SERVICE_INCLUDES || GDATA_INCLUDE_WEBMASTERTOOLS_SERVICE

#import "GDataSiteKeyword.h"
#import "GDataWebmasterToolsConstants.h"

// keyword, like
//  <wt:keyword source='internal'>cake</wt:keyword>

static NSString* const kSourceAttr = @"source";

@implementation GDataSiteKeyword

+ (NSString *)extensionElementPrefix    { return kGDataNamespaceWebmasterToolsPrefix; }
+ (NSString *)extensionElementURI       { return kGDataNamespaceWebmasterTools; }
+ (NSString *)extensionElementLocalName { return @"keyword"; }

+ (GDataSiteKeyword *)keywordWithSource:(NSString *)source
                            stringValue:(NSString *)value {

  GDataSiteKeyword *obj = [self object];
  [obj setSource:source];
  [obj setStringValue:value];
  return obj;
}

- (void)addParseDeclarations {

  NSArray *attrs = [NSArray arrayWithObject:kSourceAttr];
  [self addLocalAttributeDeclarations:attrs];

  [self addContentValueDeclaration];
}

#pragma mark -

- (NSString *)source {
  return [self stringValueForAttribute:kSourceAttr];
}

- (void)setSource:(NSString *)str {
  [self setStringValue:str forAttribute:kSourceAttr];
}

- (NSString *)stringValue {
  return [self contentStringValue];
}

- (void)setStringValue:(NSString *)str {
  [self setContentStringValue:str];
}

@end

#endif // !GDATA_REQUIRE_SERVICE_INCLUDES || GDATA_INCLUDE_WEBMASTERTOOLS_SERVICE
