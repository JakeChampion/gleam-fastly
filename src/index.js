import { main } from "./compute.mjs";
import { allowDynamicBackends } from "fastly:experimental";
allowDynamicBackends(true);
main()