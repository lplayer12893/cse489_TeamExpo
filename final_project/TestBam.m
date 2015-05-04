function A = TestBam()
	tickers = {'AAPL','AHS','AMD','FCX','FDX','HAL','LUV','MS','SGY','TSLA'};
	bitsPerParam = 10;

	for index = 1:2
		% Encode the data
		[originalData, originalClassification] = readInputs(strcat('Data/', tickers{7}, '_Data.csv'));
		[encodedData, encodedClassification] = getEncodedData(bitsPerParam);

		buyClass =     [1 1 1];
		sellClass =    [-1 -1 -1];
		holdClass =    [1 -1 1];

		for i = 1:size()
			% Pass a row of data to BAM
			inputData = encodedData(i,:);
			classification = zeros(1, 3);

			cent = generateCentroid(encodedData, encodedClassification, loadCorrelations(bitsPerParam));
			buyCent = cent(1);
			holdCent = cent(2);
			sellCent = cent(3);
			results = zeros(length(encodedData), 5); % 5 rows for classification, open, high, low, and close

			[outX, outY] = BAM(inputData, Classification, buyCent, sellCent, holdCent);

			if isequal(outY, buyClass)
				results(i, 1) = -1;
			elseif isequal(outY, sellClass)
				results(i, 1) = 1;
			elseif isequal(outY, holdClass)
				results(i, 1) = 0;
			else
				results(i, 1) = 0;
			end

			results(i, 2) = originalData(i, 32);
			results(i, 3) = originalData(i, 17);
			results(i, 4) = originalData(i, 20);
			results(i, 5) = originalData(i, 12);


		end

		csvwrite(strcat('Data/', tickers{index}, '_output.csv'), [results]);
	end

	A = 1;

