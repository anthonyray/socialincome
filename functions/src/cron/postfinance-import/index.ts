import * as functions from 'firebase-functions';
import { PostFinanceImporter } from './PostFinanceImporter';

/**
 * Function periodically connects to the gmail account where we send the postfinance balance statements,
 * parses the emails and stores the current balances into firestore.
 */
export default functions.pubsub.schedule('0 * * * *').onRun(async () => {
	const postFinanceImporter = new PostFinanceImporter();
	const balances = await postFinanceImporter.retrieveBalanceMails();
	await postFinanceImporter.storeBalances(balances);
});
