import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_nevigation/pages/dashboard.dart';
import 'package:nested_nevigation/pages/page1/sub_nav_scaffold.dart';
import 'package:nested_nevigation/pages/page1/subpage1.dart';
import 'package:nested_nevigation/pages/page1/subpage2.dart';
import 'package:nested_nevigation/pages/page1/subpage_base.dart';
import 'package:nested_nevigation/pages/page2.dart';
import 'package:nested_nevigation/pages/page2/scaffold_navbar.dart';
import 'package:nested_nevigation/pages/page3/sidebar_navigation.dart';
import 'package:nested_nevigation/pages/page3/subpage_3_3.dart';
import 'package:nested_nevigation/pages/page4/page4.dart';
import 'package:nested_nevigation/pages/page4/sub_nav_drawer.dart';
import 'package:nested_nevigation/pages/page4/sub_page_basic.dart';
import 'package:nested_nevigation/pages/page4/subpage4.dart';
import 'package:nested_nevigation/pages/page4/subpage5.dart';
import 'package:nested_nevigation/pages/page5/detail_screen.dart';
import 'package:nested_nevigation/pages/page5/page5.dart';
import 'package:nested_nevigation/pages/page5/root_screen.dart';
import 'package:nested_nevigation/pages/page5/scaffold_navigationrail.dart';
import 'package:nested_nevigation/pages/page5/subpage_5_1.dart';
import 'package:nested_nevigation/pages/page5/subpage_5_2.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _subNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'subNav');
final goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: "/",
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const Dashboard();
        },
        routes: [
          ShellRoute(
              builder: (context, state, child) {
                return SubNavScaffold(subNavBody: child);
              },
              routes: [
                GoRoute(
                    path: "page1/subpagebase",
                    name: "subpagebase",
                    builder: (context, state) => const Subpagebase()),
                GoRoute(
                    path: "page1/subpage1",
                    name: "subpage1",
                    builder: (context, state) => const Subpage1()),
                GoRoute(
                  path: "page1/subpage2",
                  name: "subpage2",
                  builder: (context, state) => const Subpage2(),
                )
              ]),
          // ]),
          // page1
          GoRoute(
              path: "page2",
              builder: (context, state) {
                return const Page2();
              }),
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              // Return the widget that implements the custom shell (in this case
              // using a BottomNavigationBar). The StatefulNavigationShell is passed
              // to be able access the state of the shell and to navigate to other
              // branches in a stateful way.
              return ScaffoldWithNavBar(navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              // The route branch for the first tab of the bottom navigation bar.
              StatefulShellBranch(
                navigatorKey: _sectionANavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the first tab of the
                    // bottom navigation bar.
                    path: 'a',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(label: 'A', detailsPath: '/a/details'),
                    routes: <RouteBase>[
                      // The details screen to display stacked on navigator of the
                      // first tab. This will cover screen A but not the application
                      // shell (bottom navigation bar).
                      GoRoute(
                        path: 'details',
                        builder: (BuildContext context, GoRouterState state) =>
                            const DetailsScreen(label: 'A'),
                      ),
                    ],
                  ),
                ],
              ),

              // The route branch for the second tab of the bottom navigation bar.
              StatefulShellBranch(
                // It's not necessary to provide a navigatorKey if it isn't also
                // needed elsewhere. If not provided, a default key will be used.
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the second tab of the
                    // bottom navigation bar.
                    path: 'b',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(
                      label: 'B',
                      detailsPath: '/b/details/1',
                      secondDetailsPath: '/b/details/2',
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'details/:param',
                        builder: (BuildContext context, GoRouterState state) =>
                            DetailsScreen(
                          label: 'B',
                          param: state.pathParameters['param'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // The route branch for the third tab of the bottom navigation bar.
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the third tab of the
                    // bottom navigation bar.
                    path: 'c',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(
                      label: 'C',
                      detailsPath: '/c/details',
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'details',
                        builder: (BuildContext context, GoRouterState state) =>
                            DetailsScreen(
                          label: 'C',
                          extra: state.extra,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              // Return the widget that implements the custom shell (in this case
              // using a BottomNavigationBar). The StatefulNavigationShell is passed
              // to be able access the state of the shell and to navigate to other
              // branches in a stateful way.
              return SidebarPage(navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              // The route branch for the first tab of the bottom navigation bar.
              StatefulShellBranch(
                navigatorKey: _sectionANavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the first tab of the
                      // bottom navigation bar.
                      path: 'page3/flutter',
                      builder: (BuildContext context, GoRouterState state) =>
                          const Subpage31()),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the first tab of the
                      // bottom navigation bar.
                      path: 'page3/firebase',
                      builder: (BuildContext context, GoRouterState state) =>
                          const SubPage33()),
                ],
              ),

              // The route branch for the second tab of the bottom navigation bar.
              StatefulShellBranch(
                // It's not necessary to provide a navigatorKey if it isn't also
                // needed elsewhere. If not provided, a default key will be used.
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the second tab of the
                      // bottom navigation bar.
                      path: 'page3/html',
                      builder: (BuildContext context, GoRouterState state) =>
                          const Subpage32()),
                ],
              ),

              // The route branch for the third tab of the bottom navigation bar.
            ],
          ),
          GoRoute(
              path: "page4",
              builder: (context, state) {
                return const Page4();
              }),
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              // Return the widget that implements the custom shell (in this case
              // using a BottomNavigationBar). The StatefulNavigationShell is passed
              // to be able access the state of the shell and to navigate to other
              // branches in a stateful way.
              return SubNavDrawer(navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              // The route branch for the first tab of the bottom navigation bar.
              StatefulShellBranch(
                // navigatorKey: _sectionANavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the first tab of the
                      // bottom navigation bar.
                      path: 'page4/page4basic',
                      builder: (BuildContext context, GoRouterState state) =>
                          const SubPageBasic()),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _sectionANavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the first tab of the
                      // bottom navigation bar.
                      path: 'page4/profile',
                      builder: (BuildContext context, GoRouterState state) =>
                          const Subpage4()),
                ],
              ),

              // The route branch for the second tab of the bottom navigation bar.
              StatefulShellBranch(
                // It's not necessary to provide a navigatorKey if it isn't also
                // needed elsewhere. If not provided, a default key will be used.
                routes: <RouteBase>[
                  GoRoute(
                      // The screen to display as the root in the second tab of the
                      // bottom navigation bar.
                      path: 'page4/course',
                      builder: (BuildContext context, GoRouterState state) =>
                          const Subpage5()),
                ],
              ),

              // The route branch for the third tab of the bottom navigation bar.
            ],
          ),
          GoRoute(
              path: "page2",
              builder: (context, state) {
                return const Page5();
              }),
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              // Return the widget that implements the custom shell (in this case
              // using a BottomNavigationBar). The StatefulNavigationShell is passed
              // to be able access the state of the shell and to navigate to other
              // branches in a stateful way.
              return ScaffoldWithNavigationRail(
                  navigationShell: navigationShell);
            },
            branches: <StatefulShellBranch>[
              // The route branch for the first tab of the bottom navigation bar.
              StatefulShellBranch(
                navigatorKey: _sectionANavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the first tab of the
                    // bottom navigation bar.
                    path: 'a',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(label: 'A', detailsPath: '/a/details'),
                    routes: <RouteBase>[
                      // The details screen to display stacked on navigator of the
                      // first tab. This will cover screen A but not the application
                      // shell (bottom navigation bar).
                      GoRoute(
                        path: 'details',
                        builder: (BuildContext context, GoRouterState state) =>
                            const DetailsScreen(label: 'A'),
                      ),
                    ],
                  ),
                ],
              ),

              // The route branch for the second tab of the bottom navigation bar.
              StatefulShellBranch(
                // It's not necessary to provide a navigatorKey if it isn't also
                // needed elsewhere. If not provided, a default key will be used.
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the second tab of the
                    // bottom navigation bar.
                    path: 'b',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(
                      label: 'B',
                      detailsPath: '/b/details/1',
                      secondDetailsPath: '/b/details/2',
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'details/:param',
                        builder: (BuildContext context, GoRouterState state) =>
                            DetailsScreen(
                          label: 'B',
                          param: state.pathParameters['param'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // The route branch for the third tab of the bottom navigation bar.
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    // The screen to display as the root in the third tab of the
                    // bottom navigation bar.
                    path: 'c',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RootScreen(
                      label: 'C',
                      detailsPath: '/c/details',
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'details',
                        builder: (BuildContext context, GoRouterState state) =>
                            DetailsScreen(
                          label: 'C',
                          extra: state.extra,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]),
  ],
);
