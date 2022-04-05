<html>

<head>
    <style>
        .all-browsers {
            margin: 0;
            padding: 5px;
            background-color: lightgray;
        }

        .all-browsers>h1,
        .browser {
            margin: 10px;
            padding: 5px;
        }

        .browser {
            background: white;
        }

        .browser>h2,
        p {
            margin: 4px;
            font-size: 90%;
        }

        footer {
            text-align: center;
            padding: 3px;
            background-color: DarkSalmon;
            color: white;
        }
    </style>
</head>

<body>
    <jsp:include page="header.html" />
    <div style="padding-left:16px">
        <div style="align:center">
            <center>
                <img src=bank.png />
                <center>
        </div>


        <article class="all-browsers">
            <h1>XYZ BANK</h1>
            <article class="browser">
                <p>One of the earliest banks in South India, "XYZ Bank" came into being during the Swadeshi
                    movement.<br>
                    The establishment of the bank was the fulfillment of the dreams of a group of enterprising men who
                    joined together at Thrissur,<br>
                    a major town (now known as the Cultural Capital of Kerala), in the erstwhile State of Cochin to
                    provide for the people a safe,<br>
                    efficient and service oriented repository of savings of the community on one hand and to free the
                    business community from the clutches of greedy money lenders on the other by providing need based
                    credit at reasonable rates of interest.</p>
            </article>

            <footer>
                <p>Author:xyz Refsnes<br>
                    <a href="mailto:xyzbank@eg.com">xyzbank@eg.com</a></p>
            </footer>
    </div>
</body>

</html>