#import <Foundation/Foundation.h>

@interface SUNetworkMonitor : NSObject
- (int)currentNetworkType;
@end

char* stringFromNetworkType(int type) {
	switch (type) {
		case 0:
			return "Not Connected";
		case 1:
			return "WiFi";
		case 2:
			return "GPRS/EDGE";
		case 3:
			return "3G";
		default:
			return "Other";
	}
}

void usage() {
	printf("Usage: networkstatus [-ns]\n");
	printf("  -n:	View network status as a number\n");
	printf("  -s:	View network status as string\n");
	printf("  -h:	Print this help\n");
	printf("\n");
	printf("Output:\n");
	printf("  0: Not connected\n");
	printf("  1: WiFi\n");
	printf("  2: GPRS/EDGE\n");
	printf("  3: 3G\n");
}

int main(int argc, char** argv, char** envp) {
	int option;
	BOOL nflag = NO, sflag = NO;
	while ((option = getopt(argc, argv, "ns")) != -1) {
		switch (option) {
			case 'n':
				nflag = YES;
				break;
			case 's':
				sflag = YES;
				break;
			default:
				usage();
				return 1;
		}
	}
	argc -= optind;
	argv += optind;

	if (!nflag && !sflag) {
		usage();
		return 0;
	}

	SUNetworkMonitor* m = [[SUNetworkMonitor alloc] init];
	int network = [m currentNetworkType];

	if (nflag && sflag) {
		printf("%d: %s\n", network, stringFromNetworkType(network));
	} else {
		if (nflag) {
			printf("%d\n", network);
		}

		if (sflag) {
			printf("%s\n", stringFromNetworkType(network));
		}
	}

	return 0;
}
