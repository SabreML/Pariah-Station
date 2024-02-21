#ifndef PRELOAD_RSC //set to:
#define PRELOAD_RSC 1 // 0 to allow using external resources or on-demand behaviour;
#endif // 1 to use the default behaviour;
								// 2 for preloading absolutely everything;

#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

#if defined(UNIT_TESTS)
//Hard del testing defines
#define REFERENCE_TRACKING
#define REFERENCE_TRACKING_DEBUG
#define FIND_REF_NO_CHECK_TICK
#define GC_FAILURE_HARD_LOOKUP
#endif

#ifdef TGS
// TGS performs its own build of dm.exe, but includes a prepended TGS define.
#define CBT
#endif

// A reasonable number of maximum overlays an object needs
// If you think you need more, rethink it
#define MAX_ATOM_OVERLAYS 100

#if !defined(CBT) && !defined(SPACEMAN_DMM) && !defined(OPENDREAM)
#warn Building with Dream Maker is no longer supported and will result in errors.
#warn In order to build, run BUILD.bat in the bin directory.
#warn Consider switching to VSCode editor instead, where you can press Ctrl+Shift+B to build.
#endif

//#define UNIT_TESTS //If this is uncommented, we do a single run though of the game setup and tear down process with unit tests in between

// #define TESTING
// #define REFERENCE_TRACKING
// #define GC_FAILURE_HARD_LOOKUP
